class ContractsController < ApplicationController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:error] = t('not_authorized')
    redirect_to contracts_path
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to contract_path(@contract)
<<<<<<< .mine
      flash[:success] = I18n.t('contracts.save')
=======
      flash[:success] = t('helpers.flash.created', model: @contract.model_name.human.titleize)
>>>>>>> .theirs
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    new_contract_params = contract_params

    if @contract.update(new_contract_params)
      redirect_to contract_path(@contract)
      flash[:success] = t('helpers.flash.updated', model: @contract.model_name.human.titleize)
    else
      render :edit
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_path
    flash[:success] = t('helpers.flash.destroyed', model: @contract.model_name.human.titleize)
  end

  private

  def contract_params
    params.require(:contract).permit(Contract.column_names.map(&:to_sym))
  end
end