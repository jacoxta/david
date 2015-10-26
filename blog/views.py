from django.shortcuts import render, render_to_response
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, InvalidPage, EmptyPage

from django.http import HttpResponseRedirect

import time
from calendar import month_name

from blog.models import Entrada, Comentario

from django.forms import ModelForm
from django.core.context_processors import csrf

class FormularioComentario(ModelForm):
	class Meta:
		model = Comentario
		exclude = ["identrada"]


def poncomentario(request, pk):
	p = request.POST

	if 'mensaje' in p:
		autor = "Anonymous"

		if p["autor"]: autor = p["autor"]

		comentario = Comentario(identrada=Entrada.objects.get(pk=pk))
		cf = FormularioComentario(p,instance = comentario)
		cf.fields["autor"].required = False

		comentario = cf.save(commit = False)
		comentario.autor = autor
		comentario.save()

	return HttpResponseRedirect(reverse("blog.views.entrada", args=[pk]))


def mkmonth_list():
	if not Entrada.objects.count(): return []

	year, month=time.localtime()[:2]
	first = Entrada.objects.order_by("fecha")[0]
	fyear = first.fecha.year
	fmonth = first.fecha.month
	months=[]

	for y in range(year, fyear-1,-1):
		start, end = 12, 0
		if y == year : start=month
		if y == fyear: end=fmonth-1 

		for m in range(start,end,-1):
			months.append((y,m,month_name[m]))

	return months	
	

def month(request, year,month):
	entrada=Entrada.objects.filter(fecha__year=year, fecha__month=month)
	return render_to_response("listado.html",dict(entrada=entrada, months=mkmonth_list()))
# Create your views here.
def main(request):
	entrada = Entrada.objects.all().order_by("-fecha")
	paginator = Paginator(entrada,3)

	try: pagina = int (request.GET.get("page","1"))
	except ValueError: pagina = 1

	try:
		entrada = paginator.page(pagina)
	except (InvalidPage. EmptyPage):
		entrada = paginator.page(paginator.num_pages)

	return render_to_response("listado.html",dict(entrada=entrada, months=mkmonth_list()))


def entrada(request,pk):
	identrada=Entrada.objects.get(pk=int(pk))
	comentario=Comentario.objects.filter(identrada=identrada)
	p=dict(entrada=identrada, comentario=comentario, form=FormularioComentario())
	p.update(csrf(request))
	return render_to_response("entrada.html",p)






