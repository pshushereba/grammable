require 'rails_helper'

RSpec.describe GramsController, type: :controller do

	describe "grams#update" do
		it "should allow users to successfully update grams" do

		end

		it "should have http 404 error if the gram cannot be found" do

		end

		it "should render the edit form with an http status of unprocessable_entity" do

		end
	end

	describe "grams#edit" do
		it "should successfully show the edit form if the gram is found" do
			p = FactoryGirl.create(:gram)
			get :edit, id: p.id
			expect(response).to have_http_status(:success)
		end

		it "should return a 404 error message if the gram is not found" do
			get :edit, id: 'SWAG'
			expect(response).to have_http_status(:not_found)
		end
	end

	describe "grams#show action" do
		it "should successfully show the page if the gram is found" do
			gram = FactoryGirl.create(:gram)
			get :show, id: gram.id
			expect(response).to have_http_status(:success)
		end

		it "should return a 404 error if the gram is not found" do
			get :show, id: 'TACOCAT'
			expect(response).to have_http_status(:not_found)
		end
	end

	describe "grams#index action" do
		it "should successfully show the page" do
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe "grams#new action" do
		it "should require users to be logged in" do
			get :new
			expect(response).to redirect_to new_user_session_path
		end

		it "should successfully show the new form" do
			user = FactoryGirl.create(:user)
      		sign_in user

			get :new
			expect(response).to have_http_status(:success)
		end
	end

	describe "grams#create action" do

		it "should require users to be logged in" do
			post :create, gram: { message: "Hello" }
			expect(response).to redirect_to new_user_session_path
		end

		it "should successfully create a new gram in our database" do
			user = FactoryGirl.create(:user)
      		sign_in user

			post :create, gram: {messages: 'Hello!'}
			expect(response).to redirect_to root_path

			gram = Gram.last
			expect(gram.messages).to eq("Hello!")
			expect(gram.user).to eq(user)
		end

		it "should properly deal with validation errors" do
			user = FactoryGirl.create(:user)
      		sign_in user

			post :create, gram: {messages: ''}
			expect(response).to have_http_status(:unprocessable_entity)
			expect(Gram.count).to eq 0
		end
	end

end
