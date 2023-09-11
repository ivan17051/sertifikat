@extends('layouts.layout')

@section('masterShow')
menu-open
@endsection

@section('unitKerjaStatus')
active
@endsection

@section('content')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="@if(!Auth::user())margin-left: 0; @endif">
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
                        <li class="breadcrumb-item"><a href="#">Data Master</a></li>
                        <li class="breadcrumb-item active">Unit Kerja</li>
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
                    <h3 class="card-title">Unit Kerja</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nama</th>
                                <th>Nama Alias</th>
                                <th>Alamat</th>
                                <th hidden>ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($unitkerja as $unit)
                            <tr>
                                <td>{{$unit->nama}}</td>
                                <td>{{$unit->nama_alias}}</td>
                                <td>{{$unit->alamat}}</td>
                                <td hidden>{{$unit->id}}</td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Nama</th>
                                <th>Nama Alias</th>
                                <th>Alamat</th>
                                <th hidden>ID</th>
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
@include('layouts.alert')
<!-- DataTables  & Plugins -->
<script src="{{asset('public/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/plugins/jszip/jszip.min.js')}}"></script>
<script src="{{asset('public/plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{asset('public/plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>

<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });
</script>
@endsection