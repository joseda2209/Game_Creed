const {createHash} = require('crypto')
const {PrismaClient} = require('@prisma/client')
const { ReasonPhrases, StatusCodes } = require('http-status-codes')
const {generateAccessToken} = require('./auth.utils')
const { logger } = require('../../../utils')
const { updateLastAccess } = require('../person/user.utils')

const prisma = new PrismaClient()

const login = async(req,res) => {
    try {
        logger.info(`login----> ${req.body}`)
        const password = createHash('sha256').update(req.body.password).digest('hex')
        const userName = req.body.userName
        const user = await prisma.user.findFirst({
            where:{
                userName,
                password
            }
        })
        logger.warn(JSON.stringify(user))
        if (user) {
            const token = await generateAccessToken({userName, rol: user.rolId}, user.id)
            user.lastAccess = await updateLastAccess(user.id)
            res.json({token, user})
        } else {
            const error = 'Datos de ingreso inválidos'
            logger.error(error)
            res.status(StatusCodes.NOT_FOUND).send({error})
        }
    } catch(err) {
        logger.error(err);
        return res.status(StatusCodes.INTERNAL_SERVER_ERROR).send({error: ReasonPhrases.INTERNAL_SERVER_ERROR})
    } finally {
        await prisma.$disconnect()
    }
}

const logout = async (req,res) => {
    try {
        logger.info('logout')
        const authHeader = req.headers['authorization'];
        const token = authHeader.split(' ')[1];
        const authToken = await getAuthToken(token);
        if (authToken) {
            await prisma.authorizorToken.delete({
                where: {
                    id: authToken.id
                }
            })
        }
        res.sendStatus(StatusCodes.NO_CONTENT)
    } catch (error) {
        logger.error(error)
        return res.status(StatusCodes.INTERNAL_SERVER_ERROR).send({error: ReasonPhrases.INTERNAL_SERVER_ERROR})
    } finally {
        await prisma.$disconnect()
    }
}

const getAuthToken = token => {
    return prisma.authorizorToken.findFirst({
        where: {
            token
        }
    })
}

module.exports = {
    login,
    logout
}