# Generated by Django 2.2.1 on 2019-06-04 03:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20190604_1001'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='price',
            field=models.IntegerField(default='12000'),
        ),
        migrations.AddField(
            model_name='productgroup',
            name='is_all_price',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='productgroup',
            name='price',
            field=models.IntegerField(default='12000'),
        ),
    ]
