#coding:utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                 :name, :role, :send_address
  # attr_accessible :title, :body


  #Relation
  has_many :reports

  #Validation
  #validate :single_send_address_is_collect_format_or_null
  validate :multi_send_address_is_collect_format_or_null
  def admin?
     role == "admin"
  end

  def single_send_address_is_collect_format_or_null
    reg = /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/

    unless  reg === send_address || send_address.blank?
      errors.add(:send_address , "正しくないフォーマットで書かれています。(空欄可) #{send_address}")
    end
  end

  def multi_send_address_is_collect_format_or_null
    reg = /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/

    error_flag = false
    unless send_address.blank?#空欄はチャック対象外

      #テキストエリアの内容を取得して改行で区切る
      address_array = Array.new()
      send_address.each_line do |line|
        address_array.push line.strip
      end

      #分割した要素ずつ正しいアドレスの形をしているかチェックする。
      #配列の形でmodelが格納していれば、この処理難度も書かなくていいのでは。
      #リファクタリングすべき場所を作ってしまった。あとでなおす
      address_array.each do |s|
        #debugger
        unless reg === s
          errors.add(:send_address , "正しくないフォーマットで書かれています。(空欄可) #{send_address}")
        end
      end
    end

  end

end
