from django.shortcuts import render
from rest_framework.response import Response
from rest_framework import status
from .api.serializer import ProductSerializer
from .models import Product, ProductGroup, SFCombination, SFItem, SFValue
from rest_framework.decorators import api_view
from django.http import HttpResponse
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

@api_view(['GET','POST', 'PUT', 'DELETE'])
def Product_list(request):
    uid = request.user.id
    
    # size_type = request.GET.get('size_type', '')
    # color_type = request.GET.get('color_type', '')

    product_group = ProductGroup.objects.get(user_id=uid)
    products = Product.objects.filter(product_group_id=product_group.pk)
    res = {
        'product_group' : product_group.name,
        # 'products' : str(products)
    }
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)
    return Response(str())