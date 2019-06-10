from .api.viewsets import ProductViewSet, ProductGroupViewSet, UserViewSet, SFCombinationViewSet, SFItemViewSet, SFValueViewSet, ProductPhotoViewSet, MainView
from rest_framework import routers

router = routers.DefaultRouter()
router.register('product-group', ProductGroupViewSet)
router.register('product', ProductViewSet)
router.register('user', UserViewSet)
router.register('sf-item', SFItemViewSet)
router.register('sf-value', SFValueViewSet)
router.register('sf-combination', SFCombinationViewSet)
router.register('product-photo', ProductPhotoViewSet)
router.register('products', MainView)
