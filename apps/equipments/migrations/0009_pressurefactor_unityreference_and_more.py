# Generated by Django 4.1 on 2022-08-18 22:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('equipments', '0008_alter_pressurefactor_subequipment'),
    ]

    operations = [
        migrations.AddField(
            model_name='pressurefactor',
            name='unityReference',
            field=models.ForeignKey(default=7, on_delete=django.db.models.deletion.CASCADE, to='equipments.physicalunit'),
        ),
        migrations.AlterField(
            model_name='pressurefactor',
            name='subequipment',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='equipments.subequipment'),
        ),
    ]
