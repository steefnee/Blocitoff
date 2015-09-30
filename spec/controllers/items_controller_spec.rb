require 'rails_helper'

RSpec.describe ItemsController, type: :controller do


      describe "GET new" do
        it "returns http success" do
          get :new
          expect(response).to have_http_status(:success)
        end

        it "instantiates @item" do
          get :new
          expect(assigns(:item)).not_to be_nil
        end
      end

      describe "POST create" do
        it "increases the number of Item by 1" do
          expect{item :create, item: {title: RandomData.random_sentence}}.to change(Post,:count).by(1)
        end

        it "assigns the new item to @item" do
          item :create, item: {title: RandomData.random_sentence}
          expect(assigns(:item)).to eq Item.last
        end

      end

end
