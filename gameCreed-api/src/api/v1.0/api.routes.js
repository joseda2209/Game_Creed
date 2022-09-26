const { Router } = require('express')


const {logger} = require('../../utils')

const router = Router()

/**
 * GET v1.0/status
 */
router.get('/status', (req, res) => {
    res.json({ status: 'OK' })
    logger.error('entro a status')
  
  })

  module.exports = {
    router
  }