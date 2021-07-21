from user.serializers import UserSerializer
from rest_framework import generics, authentication, permissions
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.settings import api_settings
from user.serializers import UserSerializer, AuthTokenSerializer



class CreateUserView(generics.CreateAPIView):
    """Create a new user in the system"""
    serializer_class = UserSerializer


class CreateTokenView(ObtainAuthToken):
    """Create a new user in the system"""
    serializer_class = AuthTokenSerializer
    # sets render so we can view endpoint on browser
    renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES

class ManageUserView(generics.RetrieveUpdateAPIView):
    """CManage the authenticated user"""
    serializer_class = UserSerializer
    # sets render so we can view endpoint on browser
    authentication_classes = (authentication.TokenAuthentication,)
    permissions_classes = (permissions.IsAuthenticated,)

    def get_object(self):
        """Retrieve and retuen authentication user"""
        return self.request.user