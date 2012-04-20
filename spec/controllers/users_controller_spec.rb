require 'spec_helper'

describe UsersController do
	describe 'GET index' do
		before do
			@ox = User.create(username: 'ox', display_name: 'Alex Oxlade Chamberlain', status: "true")
			@cesc = User.create(username: 'cesc', display_name: 'Cesc Fabregas', status: "true")
			@robin = User.create(username: 'robin', display_name: 'Robin Van Persie', status: "true")
		end

		def do_request
			get :index, format: 'json'
		end

		subject {do_request}
		it {should be_success}

		it "should return all the users" do
			subject
			assigns(:users).to_a.should =~ [@ox, @cesc, @robin]
		end
	end

	describe 'GET show' do
		before do
			@thomas = User.create("username" => 'thomas', "display_name" => 'Thomas Vermaelen', "status"=> "true")
			@params = {id: @thomas.id}
		end

		def do_request(params = {})
			get :show, params.merge({format: 'json'})
		end

		it 'should be success' do
			do_request @params
			response.should be_success
		end

		it "should return correct user" do
			do_request @params
			assigns(:user).should == @thomas
		end

	end

	describe 'POST create' do
		let(:params) {{"username" => 'theo', "display_name" => 'Theo Walcott', "status" => "true"}}
		def do_request(params = {})
			post :create, params
		end

		it "should create new user" do
			expect {
				do_request params
			}.to change(User, :count).by(1)
		end
	end

	describe 'PUT update' do
		let!(:user) {User.create(username: 'theo', display_name: 'Theo Walcott', status: "true")}
		let(:params) {{"id" => user.id, "username" => 'theo', "display_name" => 'Theo the Flyer', "status" => "true"}}

		def do_request(params={})
      put :update, params
    end

    it "should be success" do
      do_request params
      response.should be_success
    end

    it "should update the user" do
      do_request params
      user.reload.display_name.should == "Theo the Flyer"
    end
	end
end