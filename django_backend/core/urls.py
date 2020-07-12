from django.urls import path, include
from . import views

app_name = 'core'

urlpatterns = [
    path('products/', views.ProductInfoView.as_view()),
    path('otp/generate/', views.generate_otp),
    path('otp/verify/', views.verify_otp),
    path('logout/', views.LogoutView.as_view()),
    path('product/<int:pk>/add/', views.add_to_cart),
    path('product/<int:pk>/delete/', views.remove_from_cart),
    path('product/<int:pk>/remove/', views.remove_single_item_from_cart),
]