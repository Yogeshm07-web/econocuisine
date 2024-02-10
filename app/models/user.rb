# app/models/user.rb

class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Additional attributes
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :admin, :boolean, default: false
  attribute :budget, :integer # Add budget attribute

  has_many :reviews
  has_one :inventory
end
