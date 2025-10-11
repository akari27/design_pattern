# 保護プロキシ
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

# 仮想プロキシ
class RealImage
  attr_reader :height

  def initialize(file_path)
    @file_path = file_path
    @is_loaded = false
    @height = 1080
  end

  def load_image
    return if @is_loaded

    puts '画像を読み込み中...'
    sleep(1)
    @is_loaded = true
    puts '読み込み完了'
  end

  def display
    puts '画像を表示します'
    load_image
    puts '[画像]'
  end
end

class ImageProxy
  def initialize(file_path)
    @file_path = file_path
    @real_image = nil
  end

  def display
    subject.display
  end

  def height
    if @real_image
      subject.height
    else
      600 # デフォルト値を返す
    end
  end

  private

  def subject
    @real_image ||= RealImage.new(@file_path)
  end
end

image_url = 'test_path'
proxy = ImageProxy.new(image_url)
puts proxy.height # RealImageはまだ生成されていないため、デフォルト値が返される

proxy.display # ここで生成される
proxy.display # 2回目以降はキャッシュされたRealImageが使われる
puts proxy.height
