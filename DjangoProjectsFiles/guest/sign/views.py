# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from sign.models import Event,Guest
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, get_object_or_404


# Create your views here.
def index(request):
    return HttpResponse("Hello Django!")

def login_page(request):
    return render(request,'login_page.html')

#登录操作
def login_action(request):
    
    if request.method=="POST":
        username=request.POST.get("username","")
        password=request.POST.get("password","")
        # if username=="admin" and password=="admin123" :
            #改造之前
            #return HttpResponse("Login Success , Wellcome !")
            # response=HttpResponseRedirect('/event_manage/')
            # response.set_cookie('user',username,3600)
            # return response

            #改造后，使用django自带的auth认证登录
        user=auth.authenticate(username=username,password=password)
        if user is not None:
                auth.login(request,user)
                request.session['user']=username
                response=HttpResponseRedirect('/event_manage/')
                return response


        else:
            return render(request,'login_page.html',{"error_info":"username or passowrd is error,please check them "})

#登录成功后发布会跳转页
@login_required
def event_manage(request):
    username=request.session.get('user','')
    event_list=Event.objects.all()
    paginator = Paginator(event_list, 5)
    page = request.GET.get('page')
    try:
        contacts = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        contacts = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        contacts = paginator.page(paginator.num_pages)
    return render(request,"event_manage.html",{"user":username,"events":contacts,"login_success":"welcome"})
                                                                
@login_required
def search_name(request):
    username=request.session.get('name','')
    search_name=request.GET.get('name','')
    event_list=Event.objects.filter(name__contains=search_name)
    return render(request, "event_manage.html", {"user": username,"events": event_list})

@login_required
def guest_manage(request):
    username = request.session.get('user', '')
    guest_list = Guest.objects.all()
    paginator = Paginator(guest_list, 5)
    page = request.GET.get('page')
    try:
        contacts = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        contacts = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        contacts = paginator.page(paginator.num_pages)
    return render(request, "guest_manage.html", {"user": username,"guests":  contacts,"login_success":"welcome"})

@login_required
def search_phone(request):
    username = request.session.get('user', '')
    search_phone=request.GET.get('name','')
    guest_list=Guest.objects.filter(phone__contains=search_phone)
    return render(request, "guest_manage.html", {"user": username,"guests": guest_list})


# 签到页面
@login_required
def sign_index(request, event_id):
    event = get_object_or_404(Event, id=event_id)
    return render(request, 'sign_index.html', {'event': event})



# 签到动作
@login_required
def sign_index_action(request,event_id):
    event = get_object_or_404(Event, id=event_id)
    phone = request.POST.get('phone','')
    result = Guest.objects.filter(phone = phone)
    if not result:
        return render(request, 'sign_index.html', {'event': event,'hint': 'phone error.'})
    result = Guest.objects.filter(phone=phone,event_id=event_id)
    if not result:
        return render(request, 'sign_index.html', {'event': event,'hint': 'event id or phone error.'})
    result = Guest.objects.get(phone=phone,event_id=event_id)
    if result.sign:
        return render(request, 'sign_index.html', {'event': event,'hint': "user has sign in."})
    else:
        Guest.objects.filter(phone=phone,event_id=event_id).update(sign = '1')
        return render(request, 'sign_index.html', {'event': event,'hint':'sign in success!','guest': result})


# 退出登录
@login_required
def logout(request):
    auth.logout(request) #退出登录
    response = HttpResponseRedirect('/login_first_page/')
    return response

# user界面
@login_required
def check_user(request):
    username=request.session.get('user','')

    return render(request,'user.html',{"user":username})

@login_required
def switch(request):
    response=HttpResponseRedirect('/check_user/')
    return response