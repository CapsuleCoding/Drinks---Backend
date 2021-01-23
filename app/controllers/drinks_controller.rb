class DrinksController < ApplicationController
 
  def index
    drinks = Drink.all

    render json: DrinkSerializer.new(drinks)
  end

  
  def create
      drink = Drink.new(drink_params)
      if drink.save
        
        render json: DrinkSerializer.new(drink), status: :accepted 
      else
        
         render json: {errors: drink.errors.full_messages}, status: :unprocessable_entity 
      end
  end

 
  # def update
  #   respond_to do |format|
  #     if drink.update(drink_params)
  #       format.html { redirect_to drink, notice: 'Drink was successfully updated.' }
  #       format.json { render :show, status: :ok, location: drink }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: drink.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  
  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    
  end

  private
   
    def drink_params
      params.require(:drink).permit(:name, :image, :instructions)
    end
end
