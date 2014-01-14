require 'spec_helper'

describe TweetsController do
  let(:tweet) { create(:tweet) }
  render_views

 describe "GET 'index'" do

    it "is successful" do
      get :index
      response.should be_successful
    end

    it 'assigns @tweets' do
      get :index
      expect(assigns(:tweets)).to eq ([tweet]) # assigns refers to the @tweets instance variable available in the view (www.ruby-forum.com/topic/2277609)
    end 

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      response.should be_successful
    end

    it "creates a new form" do
      get :new
      expect(response).to render_template(:partial => '_form') 
    end
  end

  describe "POST 'create'" do
    it "receives redirection response 302" do
      tweet = FactoryGirl.create(:tweet)
      post :create, tweet: { author: tweet.author, body: tweet.body }
      expect(response.status).to eq(302)
    end

    it "redirects to a show template" do 
      tweet = FactoryGirl.create(:tweet)
      post :create, tweet: { author: tweet.author, body: tweet.body }
      expect(response).to redirect_to tweet_show_path(assigns(:tweet).id)
    end
  end

  describe "GET 'show'" do
    it "is successful" do
      tweet = FactoryGirl.create(:tweet)
      get :show, id: tweet.id
      response.should be_successful
    end

    it "renders a show template" do
      tweet = FactoryGirl.create(:tweet)
      expect(get :show, id: tweet.id).to render_template :show
    end

    it 'assigns @tweet' do
      tweet = FactoryGirl.create(:tweet)
      get :show, id: tweet.id
      expect(assigns(:tweet)).to eq (tweet)
    end
  end
end


