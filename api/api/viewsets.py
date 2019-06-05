from api.models import Product, ProductGroup, User, SFCombination, SFItem, SFValue, ProductPhoto
from .serializer import ProductSerializer, ProductGroupSerializer, UserSerializer, SFCombinationSerializer, SFItemSerializer, SFValueSerializer, ProductPhotoSerializer
from rest_framework import viewsets
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.views import APIView
import collections

class PGsView(viewsets.ModelViewSet):
    queryset = ProductGroup.objects.all()
    serializer_class = ProductGroupSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)
    @action(detail=False)
    def by_user(self, request):
        user_id = request.query_params.get('user_id')
        query = ProductGroup.objects.filter(user_id=user_id)
        serializer = self.get_serializer(query, many=True)
        result = collections.OrderedDict()
        for pgraw in serializer.data:
            pg = collections.OrderedDict()
            pg["name"] = pgraw["name"]
            pg["price"] = pgraw["price"]
            pg["is_all_price"] = pgraw["is_all_price"]
            
            pg["photos"] = {}
            queryPhoto = ProductPhoto.objects.filter(product_group_id=pgraw["id"])
            serializerPhoto = ProductPhotoSerializer(queryPhoto, many=True)
            for phoraw in serializerPhoto.data:
                temp = pg["photos"]
                pg["photos"][len(temp)] = phoraw["url"]
            
            pg["products"] = {}
            queryProduct = Product.objects.filter(product_group_id=pgraw["id"])
            serializerProduct = ProductSerializer(queryProduct, many=True)
            for praw in serializerProduct.data:
                p = collections.OrderedDict()
                p["stock"] = praw["stock_amount"]
                p["price"] = praw["price"]
                sfcombQuery = SFCombination.objects.filter(product_id=praw["id"])
                serializerSFComb = SFCombinationSerializer(sfcombQuery, many=True)
                for sfraw in serializerSFComb.data:
                    sfItemQuery = SFItem.objects.filter(id=sfraw["sf_item"])
                    serializerSFItem = SFItemSerializer(sfItemQuery, many=True)
                    temp = serializerSFItem.data[0]
                    item = temp["value"]
                    sfValueQuery = SFValue.objects.filter(id=sfraw["sf_value"])
                    serializerSFValue = SFValueSerializer(sfValueQuery, many=True)
                    temp = serializerSFValue.data[0]
                    value = temp["value"]
                    p[item] = value
                temp = pg["products"]
                temp[len(temp)] = p
                
            result[len(result)] = pg
        return Response(result)

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)

class ProductGroupViewSet(viewsets.ModelViewSet):
    queryset = ProductGroup.objects.all()
    serializer_class = ProductGroupSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)
    @action(detail=False)
    def by_user(self, request):
        user_id = request.query_params.get('user_id')
        query = ProductGroup.objects.filter(user_id=user_id)
        serializer = self.get_serializer(query, many=True)
        return Response(serializer.data)

class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)
    @action(detail=False)
    def by_product_group(self, request):
        product_group_id = request.query_params.get('product_group_id')
        query = Product.objects.filter(product_group_id=product_group_id)
        serializer = self.get_serializer(query, many=True)
        return Response(serializer.data)

class SFItemViewSet(viewsets.ModelViewSet):
    queryset = SFItem.objects.all()
    serializer_class = SFItemSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)

class SFValueViewSet(viewsets.ModelViewSet):
    queryset = SFValue.objects.all()
    serializer_class = SFValueSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)

class SFCombinationViewSet(viewsets.ModelViewSet):
    queryset = SFCombination.objects.all()
    serializer_class = SFCombinationSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)
    @action(detail=False)
    def by_product(self, request):
        product_id = request.query_params.get('product_id')
        query = SFCombination.objects.filter(product_id=product_id)
        serializer = self.get_serializer(query, many=True)
        return Response(serializer.data)

class ProductPhotoViewSet(viewsets.ModelViewSet):
    queryset = ProductPhoto.objects.all()
    serializer_class = ProductPhotoSerializer
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)
    def by_product_group(self, request):
        product_group_id = request.query_params.get('product_group_id')
        query = ProductPhoto.objects.filter(product_id=product_group_id)
        serializer = self.get_serializer(query, many=True)
        return Response(serializer.data)