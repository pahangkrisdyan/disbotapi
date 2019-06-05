from rest_framework import serializers
from api.models import ProductGroup, SFItem, SFValue, SFCombination, Product, User, ProductPhoto

class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = '__all__'

class SFCombinationSerializer(serializers.ModelSerializer):
        
    class Meta:
        model = SFCombination
        fields = '__all__'

class SFValueSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = SFValue
        fields = '__all__'

class SFItemSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = SFItem
        fields = '__all__'

class ProductGroupSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ProductGroup
        fields = '__all__'

class ProductSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Product
        fields = '__all__'

class ProductPhotoSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ProductPhoto
        fields = '__all__'