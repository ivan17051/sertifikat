@extends('layouts.layout')

@section('cekStatus')
active
@endsection

@section('content')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <!-- <h1 class="m-0">Tampilan Awal</h1> -->
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Cek Absensi</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Cek Absensi</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Unit Kerja</th>
                                <th>Tanggal</th>
                                <th>Jam Masuk</th>
                                <th>Jam Pulang</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($data as $unit)
                            <tr>
                                <td>{{isset($unit->idunitkerja) ? $unit->unitKerja->nama : ''}}</td>
                                <td>{{Carbon\Carbon::make($unit->tanggal)->isoFormat('dddd, D MMMM Y')}}</td>
                                <td>{{isset($unit->jam_msk) ? $unit->jam_msk : '-'}}</td>
                                <td>{{isset($unit->jam_plg) ? $unit->jam_plg : '-'}}</td>
                                <td>@if($unit->status==1)
                                    <span class="badge badge-warning">Sudah Absen Masuk</span>
                                    @elseif($unit->status==2)
                                    <span class="badge badge-info">Sudah Absen Pulang</span>
                                    @elseif($unit->status==3)
                                    <span class="badge badge-success">Terverifikasi</span>
                                    @elseif($unit->status==4)
                                    <span class="badge badge-danger">Izin</span>
                                    @elseif($unit->status==5)
                                    <span class="badge badge-success">Izin Terverifikasi</span>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Unit Kerja</th>
                                <th>Tanggal</th>
                                <th>Jam Masuk</th>
                                <th>Jam Pulang</th>
                                <th>Status</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

@endsection

@section('script')

<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });
</script>
@endsection