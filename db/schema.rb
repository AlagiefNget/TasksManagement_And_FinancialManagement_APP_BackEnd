# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_12_08_003420) do
=======
ActiveRecord::Schema.define(version: 2021_03_17_003246) do

  create_table "charge_types", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "currency"
    t.index ["user_id"], name: "index_charge_types_on_user_id"
  end
>>>>>>> Added expense and income models, with their categories

  create_table "charges", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "currency"
    t.float "amount"
    t.float "balance"
    t.date "due_date"
    t.string "project_name"
    t.string "client_name"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "discount"
    t.bigint "client_id", null: false
<<<<<<< HEAD
=======
    t.bigint "charge_type_id", null: false
    t.string "charge_type_name"
    t.index ["charge_type_id"], name: "index_charges_on_charge_type_id"
>>>>>>> Added expense and income models, with their categories
    t.index ["client_id"], name: "index_charges_on_client_id"
    t.index ["project_id"], name: "index_charges_on_project_id"
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

<<<<<<< HEAD
=======
  create_table "expense_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.float "actual_amount"
    t.float "budgeted_amount"
    t.float "difference"
    t.string "account"
    t.bigint "expense_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
  end

  create_table "income_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "incomes", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.float "amount"
    t.date "date"
    t.bigint "income_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["income_category_id"], name: "index_incomes_on_income_category_id"
  end

>>>>>>> Added expense and income models, with their categories
  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "currency"
    t.float "amount"
    t.float "balance"
    t.date "payment_date"
    t.string "project_name"
    t.string "client_name"
    t.bigint "charge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
<<<<<<< HEAD
    t.index ["charge_id"], name: "index_payments_on_charge_id"
=======
    t.bigint "project_id", null: false
    t.index ["charge_id"], name: "index_payments_on_charge_id"
    t.index ["project_id"], name: "index_payments_on_project_id"
>>>>>>> Added expense and income models, with their categories
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "due_date"
    t.string "client_name"
    t.string "status"
    t.text "description"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.float "amount"
    t.float "balance"
    t.string "currency"
<<<<<<< HEAD
=======
    t.boolean "payment_applied", default: false
>>>>>>> Added expense and income models, with their categories
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "todos", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "task"
    t.time "scheduled_at"
    t.date "date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.integer "status"
    t.index ["first_name"], name: "index_users_on_first_name"
  end

<<<<<<< HEAD
  add_foreign_key "charges", "clients"
  add_foreign_key "charges", "projects"
  add_foreign_key "clients", "users"
  add_foreign_key "payments", "charges"
=======
  add_foreign_key "charge_types", "users"
  add_foreign_key "charges", "charge_types"
  add_foreign_key "charges", "clients"
  add_foreign_key "charges", "projects"
  add_foreign_key "clients", "users"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "incomes", "income_categories"
  add_foreign_key "payments", "charges"
  add_foreign_key "payments", "projects"
>>>>>>> Added expense and income models, with their categories
  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "users"
end
