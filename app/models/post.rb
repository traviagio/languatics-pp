class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image,
  								styles: { thumb: "300x300>" },
  								storage: :s3,
  								s3_credentials: {
  									access_key_id: 'AKIAISJ3BURO2DLFVRKQ',
  									secret_access_key: Rails.application.secrets.secret_access_key
  								},
  								bucket: 'swagstagram'
end