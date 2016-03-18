class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :authentication_keys => {email: true}

  def serialize_from_session(key,salt)
    #record = to_adapter.get(key[0].to_param)                                                                                                                                 
    record = to_adapter.get(key.to_s)
    record if record && record.authenticatable_salt == salt
  end
end
