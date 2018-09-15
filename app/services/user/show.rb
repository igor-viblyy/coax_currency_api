class User
  class Show
    def self.call(*args)
      new(*args).call
    end

    def initialize(params = {})
      @id = params[:id]
      @email = params[:email]
    end

    def call
      User.find_by(id: @id)
    end

    private
    # attr_reader :id, :email
    #
    # def find_user(id)
    #   User.find_by(id: id)
    # end
  end
end
