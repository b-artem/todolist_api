require "rails_helper"

module API
  module V1
    RSpec.describe 'Projects API', type: :request do
      let!(:projects) { create_list(:project, 3) }

      describe 'GET #index' do
        before { get api_v1_projects_path }

        context 'when guest user' do
          it 'returns http status code 401' do
            expect(response).to have_http_status 401
          end
        end

        # context 'when user signed in' do
        #   it 'returns http status code 200' do
        #     expect(response).to have_http_status 200
        #   end

          # it 'returns array of projects' do
          #   expect(json.size).to eq projects.size
          # end
        # end

        it 'returns response in JSON' do
          expect(response.content_type).to eq 'application/json'
        end


        # it "creates a Widget" do
        #   headers = {
        #     "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        #     "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
        #   }
        #   post "/widgets", { :widget => {:name => "My Widget"} }, headers
        #
        #   expect(response.content_type).to eq("application/json")
        #   expect(response).to have_http_status(:created)
        # end
      end
    end
  end
end
