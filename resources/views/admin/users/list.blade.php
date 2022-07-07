@extends('layouts.app')
@section('content')
<div class="row" id="table-hover-row">
    <div class="col-12">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="card-title">{{__('Users')}}</h4><div class="card-search"></div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover custom-data-bs-table">
                    <thead class="table-dark">
                        <tr>
                            <th>{{ __('User')}}</th>
                            <th>{{ __('Username')}}</th>
                            <th>{{ __('Email')}}</th>
                            <th>{{ __('Phone')}}</th>
                            <th>{{ __('Joined At')}}</th>
                            <th>{{ __('Action')}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($users as $user)
                        <tr>
                            <td data-label="{{ __('User')}}">
                                <div class="row centerize">
                                    <div class="col-md-3 thumb">
                                        <img src="{{ $user->profile_photo_url ? $user->profile_photo_url : asset('images/portrait/small/avatar-s-11.jpg') }}"
                                            alt="{{ __('image')}}">
                                    </div>
                                    <span class="col-md-9 name">{{$user->fullname}}</span>
                                </div>
                            </td>
                            <td data-label="{{ __('Username')}}"><a
                                    href="{{ route('admin.users.detail', $user->id) }}">{{ $user->username }}</a>
                            </td>
                            <td data-label="{{ __('Email')}}">{{ $user->email }}</td>
                            <td data-label="{{ __('Phone')}}">{{ $user->mobile }}</td>
                            <td data-label="{{ __('Joined At')}}">{{ showDateTime($user->created_at) }}
                            </td>
                            <td data-label="{{ __('Action')}}">
                                <a href="{{ route('admin.users.detail', $user->id) }}">
                                    <button class="btn btn-icon btn-warning btn-sm" data-bs-toggle="tooltip"
                                        title="" data-original-title="{{ __('Details')}}">
                                        <i class="bi bi-display"></i>
                                    </button>
                                </a>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td class="text-muted text-center" colspan="100%">{{ __($empty_message) }}</td>
                        </tr>
                        @endforelse

                    </tbody>
                </table>
            </div>
        </div><div class="mb-1">{{ paginateLinks($users) }}</div>
    </div>
</div>

@endsection
