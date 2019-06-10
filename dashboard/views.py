from django.shortcuts import render
from django.shortcuts import redirect
from django.http import HttpResponse
from django.contrib.auth.forms import AuthenticationForm

def index(request):
    if request.user.is_authenticated:
        context = {
            'dashboard': 'active',
            'menu': 'Dashboard',
            'user': request.user
        }
        return render(request, 'lumino/index.html', context)
    else:
        return redirect('/accounts/login')

def products(request):
    if request.user.is_authenticated:
        context = {
            'products': 'active',
            'menu': 'Products',
            'user': request.user,
        }
        return render(request, 'lumino/products.html', context)
    else:
        return redirect("/dashboard")