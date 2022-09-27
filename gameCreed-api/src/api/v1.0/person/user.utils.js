const { PrismaClient } = require("@prisma/client");
const { logger } = require("../../../utils");


const prisma = new PrismaClient()

const updateLastAccess = async (id) => {
    const options = { hour12: false};
    let lastAccess = new Date().toLocaleString('en-CA', options).replace(', ', 'T').concat('.000Z')
    logger.info(`lastAccess: ${lastAccess}`)
    try{
        await prisma.user.update({
            where: {
                id
            },
            data: {
                lastAccess
            }
        })
        return lastAccess
    }
    catch (error){
        logger.error(`error al actualizar ultimo acceso ${error}`)
        throw Error('error al actualizar ultimo acceso')
    }
}

module.exports = {
    updateLastAccess
}