#coding:utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #シリアライズしたtext型にYAML形式で登録する。
  #データベースが配列型をサポートしているので、そっちでもやりたかったが、やり方がわからなかった
  serialize :send_address , Array

  #teno_textはデータベースに登録しない。送付先メールアドレスの一時受け
  attr_accessor :temp_text

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                 :name, :role, :send_address, :temp_text

  #Relation
  has_many :reports

  #Validation
  #validate :single_send_address_is_collect_format_or_null
  validate :multi_send_address_is_collect_format_or_null

  #データベースに登録前、送信先アドレスを加工する
  before_save :saved_send_address

  def admin?
     role == "admin"
  end

  #送信先アドレスの加工と保存(※バリデーション済み)
  def saved_send_address
    #配列の初期化
    send_address.clear
    #各要素ずつpush
    temp_text.each_line do |line|
        send_address.push line.strip
    end
  end


  #Varidate methods
  def single_send_address_is_collect_format_or_null
    reg = /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/

    unless  reg === send_address || send_address.blank?
      errors.add(:send_address , "正しくないフォーマットで書かれています。(空欄可) #{send_address}")
    end
  end

  def multi_send_address_is_collect_format_or_null
    reg = /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/

    error_flag = false
    unless temp_text.blank?#空欄はチャック対象外

      #テキストエリアの内容を取得して改行で区切る
      address_array = Array.new()
      temp_text.each_line do |line|
        address_array.push line.strip
      end
      #debugger
      #分割した要素ずつ正しいアドレスの形をしているかチェックする。
      #配列の形でmodelが格納していれば、この処理難度も書かなくていいのでは。
      address_array.each do |s|
        #debugger
        unless reg === s
          errors.add(:temp_text , "正しくないフォーマットで書かれています。(空欄可) #{s}")
        end
      end
    end
  end
end
