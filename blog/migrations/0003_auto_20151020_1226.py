# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_comentarios'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Comentarios',
            new_name='Comentario',
        ),
    ]
