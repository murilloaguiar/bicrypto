<div class="row me-1">
    <div class="col-lg-5 col-md-5 d-none d-md-block">
        <div class="card-title">{{__('Account Balances')}}</div>
            @foreach ($wallets as $wallet)
                <div class="row">
                    <div class="col test-start">{{ $wallet->symbol }}</div>
                    <div class="col test-end">{{ getAmount($wallet->balance) }}</div>
                </div>
            @endforeach
            <div class="row"><a href="{{ route('user.wallet.index') }}" class="position-absolute bottom-0 mb-1 text-info w-75">{{__('View All Wallets')}}</a></div>
    </div>
    <div class="col-lg-7 col-md-7">
        <div class="row bg-wallet p-1 rounded">
            <a href="{{route('user.home')}}" style="display: contents;">
                <div class="col-6 test-start">
                        <div class="fs-bold fs-4 text-white">{{__('Practice Account')}}</div>
                        <div class="fs-bold fs-4 text-warning">
                            {{$general->cur_sym}}<livewire:partials.practice-balance/></div>
                </div>
                <div class="col-6 text-end">
                    <a href="javascript:void(0)"><button class="btn btn-outline-warning btn-sm"
                            data-bs-toggle="modal" data-bs-target="#practiceAmount">
                            <i class="bi bi-plus"></i>{{__('Top Up')}}</button></a>
                </div>
            </a>
        </div>
        <div class="row bg-wallet-active p-1 rounded mt-1">
            <a href="{{route('user.home.trade')}}" style="display: contents;">
                <div class="col-6 test-start">
                    <div class="fs-bold fs-4 text-white">{{__('Trade Account')}}</div>
                    <div class="fs-bold fs-4 text-success">
                        {{$general->cur_sym}}<livewire:partials.balance/></div>
                </div>
                <div class="col-6 text-end">
                    <a href="{{ route('user.deposit') }}"><button class="btn btn-outline-light btn-sm">
                            <i class="bi bi-plus"></i>{{__('Deposit')}}</button></a>
                    <a href="{{ route('user.withdraw') }}"><button class="mt-1 btn btn-outline-light btn-sm">
                            <i class="bi bi-plus"></i>{{__('Withdraw')}}</button></a>
                </div>
            </a>
        </div>
    </div>
</div>
