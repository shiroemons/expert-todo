require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_attributes) {
    { title: 'title', content: 'content', expired_at: Time.now.zone }
  }

  let(:invalid_attributes) {
    { title: nil, content: nil, expired_at: nil }
  }

  let(:valid_session) { {} }

  before { login_user(user) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      task = user.tasks.create! valid_attributes
      get :show, params: { id: task.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      task = user.tasks.create! valid_attributes
      get :edit, params: { id: task.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Task' do
        expect {
          post :create, params: { task: valid_attributes }, session: valid_session
        }.to change(Task, :count).by(1)
      end

      it 'redirects to the created task' do
        post :create, params: { task: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Task.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { task: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { title: 'title2', content: 'content', expired_at: Time.now.zone }
      }

      it 'updates the requested task' do
        task = user.tasks.create! valid_attributes
        put :update, params: { id: task.to_param, task: new_attributes }, session: valid_session
        task.reload
        expect(task.title).to eq 'title2'
      end

      it 'redirects to the task' do
        task = user.tasks.create! valid_attributes
        put :update, params: { id: task.to_param, task: valid_attributes }, session: valid_session
        expect(response).to redirect_to(task)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        task = user.tasks.create! valid_attributes
        put :update, params: { id: task.to_param, task: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task = user.tasks.create! valid_attributes
      expect {
        delete :destroy, params: { id: task.to_param }, session: valid_session
      }.to change(Task, :count).by(-1)
    end

    it 'redirects to the tasks list' do
      task = user.tasks.create! valid_attributes
      delete :destroy, params: { id: task.to_param }, session: valid_session
      expect(response).to redirect_to(tasks_url)
    end
  end
end
