class User < ApplicationRecord
  enum role: {admin: 0, viewer: 2}

  class << self
    def located_roles
      roles.keys.map do |s|
        [ApplicationController.helpers.t("users.role.#{s}"), s]
      end
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
