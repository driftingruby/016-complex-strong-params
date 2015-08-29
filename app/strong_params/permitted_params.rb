class PermittedParams < Struct.new(:params, :current_user)
  include Params::User
end
