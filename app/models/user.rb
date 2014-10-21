#coding:utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                 :name, :role, :send_adress
  # attr_accessible :title, :body

  has_many :reports

  validate :single_send_adress_is_collect_format_or_null

  def admin?
     role == "admin"
  end

  def single_send_adress_is_collect_format_or_null
    reg = /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/

    unless  reg === send_adress || send_adress.blank?
      errors.add(:send_adress , "正しくないフォーマットで書かれています。(空欄可) #{temp} \n #{send_adress}")
    end

  end

end
