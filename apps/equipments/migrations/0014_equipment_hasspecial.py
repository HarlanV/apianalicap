# Generated by Django 4.1 on 2022-08-28 17:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('equipments', '0013_rename_active_equipment_usable'),
    ]

    operations = [
        migrations.AddField(
            model_name='equipment',
            name='hasSpecial',
            field=models.BooleanField(blank=True, default=False, null=True),
        ),
    ]
