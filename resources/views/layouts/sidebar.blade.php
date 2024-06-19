@section('sidebar')
<!-- Sidebar -->
<div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
            <img src="{{asset('public/dist/img/avatar5.png')}}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
            <a href="#" class="d-block">{{Auth::user()->nama}}</a>
        </div>
    </div>

    <!-- SidebarSearch Form -->
    <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
                <button class="btn btn-sidebar">
                    <i class="fas fa-search fa-fw"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
            
            <li class="nav-item">
                <a href="{{url('/')}}" class="nav-link @yield('dashboardStatus')">
                    <i class="nav-icon fas fa-desktop"></i>
                    <p>
                        Dashboard
                    </p>
                </a>
            </li>

            <!-- <li class="nav-header">ADMIN</li> -->
            <li class="nav-item @yield('masterShow')">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-tachometer-alt"></i>
                    <p>
                        Data Master
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{route('acara.index')}}" class="nav-link @yield('acaraStatus')">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Acara</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('penilaian.index')}}" class="nav-link @yield('penilaianStatus')">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Penilaian</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('user.index')}}" class="nav-link @yield('userStatus')">
                            <i class="far fa-circle nav-icon"></i>
                            <p>User</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('peserta.index')}}" class="nav-link @yield('pesertaStatus')">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Peserta</p>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="{{route('acara.show',['id'=>'0'])}}" class="nav-link @yield('sertifikatStatus')">
                    <i class="nav-icon fas fa-file-invoice"></i>
                    <p>
                        Sertifikat
                    </p>
                </a>
            </li>
            
            <li class="nav-item">
                <a href="{{route('nilai.index')}}" class="nav-link @yield('nilaiPesertaStatus')">
                    <i class="nav-icon fas fa fa-star-half"></i>
                    <p>
                        Nilai Peserta
                    </p>
                </a>
            </li>
            <!-- <li class="nav-item">
                <a href="{{route('data.laporan')}}" class="nav-link @yield('laporanStatus')">
                    <i class="nav-icon fas fa-file-invoice"></i>
                    <p>
                        Laporan
                    </p>
                </a>
            </li> -->

        </ul>
    </nav>
    <!-- /.sidebar-menu -->
</div>
@endsection