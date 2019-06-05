from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    def __str__(self):
        return self.email

class SFItem(models.Model):
    typ = models.CharField(max_length=50)
    value = models.CharField(max_length=50)
    def __str__(self):
        return self.typ + " in " + self.value

class SFValue(models.Model):
    typ = models.CharField(max_length=50)
    value = models.CharField(max_length=50)
    def __str__(self):
        return self.value

class ProductGroup(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    price = models.IntegerField(default='12000')
    is_all_price = models.BooleanField(default=True)
    def __str__(self):
        return self.name

class Product(models.Model):
    product_group_id = models.ForeignKey(ProductGroup, on_delete=models.CASCADE)
    stock_amount = models.IntegerField()
    price = models.IntegerField(default='12000')
    def __str__(self):
        return str(self.pk)

class SFCombination(models.Model):
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)
    sf_item = models.ForeignKey(SFItem, on_delete=models.CASCADE)
    sf_value = models.ForeignKey(SFValue, on_delete=models.CASCADE)
    def __str__(self):
        return self.product_id

class ProductPhoto(models.Model):
    product_group_id = models.ForeignKey(ProductGroup, on_delete=models.CASCADE)
    url = models.CharField(max_length=100)