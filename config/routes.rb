Rails.application.routes.draw do
  # GET  URL: '/'  -> [ OFFICE # INDEX] -> VIEWS/OFFICES/INDEX.HTML.ERB
  root to: 'offices#index'

  devise_for :users
  #----for offices----
  # GET  URL: '/offices/new'  -> [ OFFICE # NEW] -> VIEWS/OFFICES/new.HTML.ERB
  # POST  URL: '/offices'  -> [ OFFICE # CREATE] -> redirected to where u want...
  # GET  URL: '/offices'  -> [ OFFICE # INDEX] -> VIEWS/OFFICES/index.HTML.ERB
  # GET  URL: '/offices/:id'  -> [ OFFICE # SHOW] -> VIEWS/OFFICES/show.HTML.ERB
  #----for booking-----
  # GET  URL: '/offices/office_id/bookings/new'  -> [ BOOKING # NEW] -> VIEWS/OFFICES/booking/new.HTML.ERB
  # POST URL: '/offices/office_id/bookings' -> [ BOOKING # CREATE ] -> renders to another page that u want..
  resources :offices, only: [:new, :create, :index, :show] do
    resources :booking, only: [:new, :create]
  end

  #--- for bookings ---
  # index, show, *new*, *create*, update, edit, destory *exclue*
  # GET URL: '/bookings' -> [ BOOKING # INDEX] -> VIEWS/BOOKINGS/index.HTML.ERB
  # GET URL: '/bookings/:id' -> [ BOOKING # SHOW] -> VIEWS/BOOKINGS/show.HTML.ERB
  # GET URL: '/bookings/:id/edit' -> [ BOOKING # EDIT] -> VIEWS/BOOKINGS/edit.HTML.ERB
  # PATCH URL: '/bookings/:id' -> [ BOOKING # UPDATE] -> VIEWS/BOOKINGS/update.HTML.ERB
  # DELETE URL: '/bookings/:id' -> [ BOOKING # DESTORY] -> VIEWS/BOOKINGS/destory.HTML.ERB

  #---- for reviews -----
  # GET URL: '/bookings/:booking_id/reviews/new' -> [ REVIEW # NEW] -> VIEWS/BOOKINGS/REVIEWS/new.HTML.ERB
  # GET URL: '/bookings/:booking_id/reviews/create' -> [ REVIEW # CREATE] -> render another page u want ...
  resources :bookings, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end

  # ---- for owner/offices ----
  # GET URL: '/owner/offices/index' [OWNER/OFFICE # INDEX] -> VIEWS/OWNER/OFFICES/index.HTML.ERB
  # ---- for owner/bookings---
  # /owners/offices
  # /owners/bookings
  namespace :owner do
    resources :offices, only: :index
    resources :bookings, except: [:index, :create, :delete]
  end
end
