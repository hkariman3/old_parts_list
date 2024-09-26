class ContactMailer < ApplicationMailer
    def send_when_admin_reply(customer, contact) #メソッドに対して引数を設定
        @user = customer #ユーザー情報
        @answer = contact.reply_text #返信内容
        mail to: customer.email, subject: '【OPL】 お問い合わせありがとうございます'
    end
end