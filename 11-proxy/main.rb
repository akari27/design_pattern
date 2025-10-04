class RealResource
  def access
    puts 'アクセス中...'
  end
end

class AuthProxy
  def initialize(user)
    @user = user
    @real_resource = nil
  end

  def access
    if @user.admin?
      @real_resource ||= RealResource.new
      @real_resource.access
    else
      puts 'アクセスが拒否されました'
    end
  end
end

class User
  attr_reader :admin

  def initialize(admin: false)
    @admin = admin
  end

  def admin?
    @admin
  end
end

normal_user = User.new(admin: false)
proxy = AuthProxy.new(normal_user) # この時点ではRealResourceは生成されない
proxy.access

admin_user = User.new(admin: true)
proxy = AuthProxy.new(admin_user) # ここでRealResourceが生成される
proxy.access
