# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_205_200_154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cells', force: :cascade do |t|
    t.integer 'row'
    t.integer 'column'
    t.boolean 'mine', default: false
    t.boolean 'revealed', default: false
    t.boolean 'flagged', default: false
    t.bigint 'game_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_id'], name: 'index_cells_on_game_id'
  end

  create_table 'games', force: :cascade do |t|
    t.integer 'rows'
    t.integer 'columns'
    t.integer 'mines'
    t.datetime 'finished_at'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'time'
    t.index ['user_id'], name: 'index_games_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'cells', 'games'
  add_foreign_key 'games', 'users'
end