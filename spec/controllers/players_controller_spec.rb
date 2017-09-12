require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  login_user

  let(:team_attributes) {{name: "New England Patriots"}}
  
  let(:patriots) {Team.create! team_attributes}

  let(:valid_attributes) { 
    { first_name: 'Tom', last_name: 'Brady', position: 'QB', team: patriots}
  }
  let(:invalid_attributes) { 
    { name: 'Bill', last_name: 'Belichick', position: 'Coach', team: patriots }
  }

  let (:brady) { Player.create! valid_attributes }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {team_id: patriots.id} 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { team_id: patriots.id, id: brady.id } 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: {team_id: patriots.id} 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { team_id: patriots.id, id: brady.id } 
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do

      it "creates a new Player" do
        expect {
          post :create, params: { team_id: patriots.id, player: valid_attributes }
        }.to change(Player, :count).by(1)
      end

      it "redirects to the created Player" do
        post :create, params: { team_id: patriots.id, player: valid_attributes }
        expect(response).to redirect_to(patriots)
      end

    end

    context "with invalid params" do

      it "does not create a new Player" do
        expect {
          post :create, params: { team_id: patriots.id, player: invalid_attributes }
        }.to change(Player, :count).by(0)
      end

      it "returns a success response" do
        post :create, params: { team_id: patriots.id, player: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {position: 'RB' } }
      
      it "updates the requested player" do
        put :update, params: {team_id: patriots.id, id: brady.id, player: new_attributes}
        expect(brady.reload.position).to eq(new_attributes[:position])
      end
    
      it "redirects to player" do  
        put :update, params: {team_id: patriots.id, id: brady.id, player: new_attributes}
        expect(response).to redirect_to(patriots)
      end
    
    end

    context "with invalid params" do
      it "does not update the team" do
        put :update, params: {team_id: patriots.id, id: brady.id, player: invalid_attributes}
        expect(brady.position).to_not eq(invalid_attributes[:position])
      end
      it "returns a success to load edit template" do
        put :update, params: {team_id: patriots.id, id: brady.id, player: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "delete #destroy" do
    it "destroys the requested team" do 
      brady
      expect {
        delete :destroy, params: {team_id: patriots.id, id: brady.id}
    }.to change(Player, :count).by(-1)
    end
    it "it redirects to team index" do
      delete :destroy, params: {team_id: patriots.id, id: brady.id}
      expect(response).to redirect_to(patriots)
    end 
  end

end
