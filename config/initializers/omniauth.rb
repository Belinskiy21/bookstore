Rails.application.config.middleware.use OmniAuth::Builder do
   provider :facebook, '338357606610020', 'a1423801b1c7d1c1d441f5ae3b0ec5ab',
            :scope => 'email,user_birthday, public_profile', :display => 'popup'
 end
