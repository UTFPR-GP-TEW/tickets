class Api::ApiController < ApplicationController

  # before_action :project_token_authentication

  def project_token_authentication

	# verificamos se foi informado o project_token
    if (!params.key?(:project_token))
	  render json: {message: 'invalid token'}, status: :unauthorized
    end

	# buscamos o projeto referente ao ticket referenciado
	# selecionamos apenas o token para verificação
    token = Project.where(Ticket.find(params[:id]).project_id).select(:token).first.token

	# efetuamos a verificação do token
    if (params[:project_token] != token)
      render json: {message: 'invalid token'}, status: :unauthorized
    end
  end

end
