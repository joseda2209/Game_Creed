const { Router } = require('express')

const {router: authRouter} = require('./auth/auth.routes')

const {logger} = require('../../utils')

const router = Router()

/**
 * GET v1.0/status
 */
router.get('/status', (req, res) => {
    res.json({ status: 'OK' })
    logger.error('entro a status')
  
  })

router.use('/', authRouter)

  module.exports = {
    router
  }