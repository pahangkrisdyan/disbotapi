# Generated by Django 2.2.1 on 2019-06-04 03:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_productphotos'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='ProductPhotos',
            new_name='ProductPhoto',
        ),
    ]
