# Generated by Django 4.1 on 2022-08-21 20:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('equipments', '0011_delete_baremodulecostfactor'),
    ]

    operations = [
        migrations.AddField(
            model_name='costmethodsguide',
            name='special_function_name',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
