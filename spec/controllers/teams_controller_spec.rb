require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  login_user
  let(:valid_attributes) { 
    { name: 'New England Patriots'}
  }
  let(:invalid_attributes) { 
    { name: '', }
  }

  let (:patriots) { Team.create! valid_attributes }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: patriots.id } 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: patriots.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do

      it "creates a new Team" do
        expect {
          post :create, params: { team: valid_attributes }
        }.to change(Team, :count).by(1)
      end

      it "redirects to the created Team" do
        post :create, params: { team: valid_attributes }
        expect(response).to redirect_to(Team.last)
      end

    end

    context "with invalid params" do

      it "does not create a new Team" do
        expect {
          post :create, params: { team: invalid_attributes }
        }.to change(Team, :count).by(0)
      end

      it "returns a success response" do
        post :create, params: { team: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: 'New York Jets' } }
      
      it "updates the requested team" do
        put :update, params: {id: patriots.id, team: new_attributes}
        expect(patriots.reload.name).to eq(new_attributes[:name])
      end
    
      it "redirects to team" do  
        put :update, params: {id: patriots.id, team: new_attributes}
        expect(response).to redirect_to(patriots)
      end
    
    end

    context "with invalid params" do
      it "does not update the team" do
        put :update, params: {id: patriots.id, team: invalid_attributes}
        expect(patriots.name).to_not eq(invalid_attributes[:name])
      end
      it "returns a success to load edit template" do
        put :update, params: {id: patriots.id, team: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "delete #destroy" do
    it "destroys the requested team" do 
      patriots
      expect {
        delete :destroy, params: {id: patriots.id}
    }.to change(Team, :count).by(-1)
    end
    it "it redirects to team index" do
      delete :destroy, params: {id: patriots.id}
      expect(response).to redirect_to(teams_url)
    end 

  end

end
