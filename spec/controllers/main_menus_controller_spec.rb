require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe MainMenusController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # MainMenu. As you add validations to MainMenu, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MainMenusController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all main_menus as @main_menus" do
      main_menu = MainMenu.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:main_menus)).to eq([main_menu])
    end
  end

  describe "GET #show" do
    it "assigns the requested main_menu as @main_menu" do
      main_menu = MainMenu.create! valid_attributes
      get :show, {:id => main_menu.to_param}, valid_session
      expect(assigns(:main_menu)).to eq(main_menu)
    end
  end

  describe "GET #new" do
    it "assigns a new main_menu as @main_menu" do
      get :new, {}, valid_session
      expect(assigns(:main_menu)).to be_a_new(MainMenu)
    end
  end

  describe "GET #edit" do
    it "assigns the requested main_menu as @main_menu" do
      main_menu = MainMenu.create! valid_attributes
      get :edit, {:id => main_menu.to_param}, valid_session
      expect(assigns(:main_menu)).to eq(main_menu)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MainMenu" do
        expect {
          post :create, {:main_menu => valid_attributes}, valid_session
        }.to change(MainMenu, :count).by(1)
      end

      it "assigns a newly created main_menu as @main_menu" do
        post :create, {:main_menu => valid_attributes}, valid_session
        expect(assigns(:main_menu)).to be_a(MainMenu)
        expect(assigns(:main_menu)).to be_persisted
      end

      it "redirects to the created main_menu" do
        post :create, {:main_menu => valid_attributes}, valid_session
        expect(response).to redirect_to(MainMenu.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved main_menu as @main_menu" do
        post :create, {:main_menu => invalid_attributes}, valid_session
        expect(assigns(:main_menu)).to be_a_new(MainMenu)
      end

      it "re-renders the 'new' template" do
        post :create, {:main_menu => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested main_menu" do
        main_menu = MainMenu.create! valid_attributes
        put :update, {:id => main_menu.to_param, :main_menu => new_attributes}, valid_session
        main_menu.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested main_menu as @main_menu" do
        main_menu = MainMenu.create! valid_attributes
        put :update, {:id => main_menu.to_param, :main_menu => valid_attributes}, valid_session
        expect(assigns(:main_menu)).to eq(main_menu)
      end

      it "redirects to the main_menu" do
        main_menu = MainMenu.create! valid_attributes
        put :update, {:id => main_menu.to_param, :main_menu => valid_attributes}, valid_session
        expect(response).to redirect_to(main_menu)
      end
    end

    context "with invalid params" do
      it "assigns the main_menu as @main_menu" do
        main_menu = MainMenu.create! valid_attributes
        put :update, {:id => main_menu.to_param, :main_menu => invalid_attributes}, valid_session
        expect(assigns(:main_menu)).to eq(main_menu)
      end

      it "re-renders the 'edit' template" do
        main_menu = MainMenu.create! valid_attributes
        put :update, {:id => main_menu.to_param, :main_menu => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested main_menu" do
      main_menu = MainMenu.create! valid_attributes
      expect {
        delete :destroy, {:id => main_menu.to_param}, valid_session
      }.to change(MainMenu, :count).by(-1)
    end

    it "redirects to the main_menus list" do
      main_menu = MainMenu.create! valid_attributes
      delete :destroy, {:id => main_menu.to_param}, valid_session
      expect(response).to redirect_to(main_menus_url)
    end
  end

end
