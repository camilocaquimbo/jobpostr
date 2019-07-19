'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ModeloSchema extends Schema {
  up () {
    this.create('modelos', (table) => {
      table.increments()
      table.timestamps()
    })
  }

  down () {
    this.drop('modelos')
  }
}

module.exports = ModeloSchema
