from django.urls import path, include
from . import views

app_name = 'core'

urlpatterns = [
    path('products/', views.ProductInfoView.as_view()),
    path('otp/generate/', views.generate_otp),
    path('otp/verify/', views.verify_otp),
    path('logout/', views.LogoutView.as_view())
]