@extends('layouts.layout')

@section('masterShow')
menu-open
@endsection

@section('acaraStatus')
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
                        <li class="breadcrumb-item active">Acara</li>
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
                    <h3 class="card-title">Data Acara</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="table1" class="table table-bordered table-striped">
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
<script>
    function edit(self){
        var $modal=$('#sunting');
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];
        // console.log(data);
        
        $modal.find('input[name=id]').val(data['id']);
        $modal.find('input[name=nama]').val(data['nama']);
        $modal.find('input[name=kategori]').val(data['kategori']);
        $modal.find('input[name=tgl_mulai]').val(data['tgl_mulai']);
        $modal.find('input[name=tgl_selesai]').val(data['tgl_selesai']);
        $modal.find('input[name=tempat]').val(data['tempat']);

        $modal.modal('show');
    }

    function hapus(self){
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];

        $('#delete').find('input[name=id]').val(data['id']);
        var $modal = $('#hapus');
        $modal.modal('show');
    }
    
    $(document).ready(function(){
        oTable = $("#table1").DataTable({
            
            processing: true,
            serverSide: true,
            ajax: {type: "POST", url: '{{route("acara.data")}}', data:{'_token':@json(csrf_token())}},
            columns: [
                { data:'id', title:'ID', visible: false},
                { data:'nama', title:'Nama'},
                { data:'kategori', title:'Kategori'},
                { data:'tgl_mulai', title:'Tanggal Pelaksanaan', render: function(e,d,row){
                    return moment(row['tgl_mulai']).format('DD MMMM YYYY') + ' - ' + moment(row['tgl_selesai']).format('DD MMMM YYYY');
                } },
                { data:'tempat', title:'Tempat', visible: false},
                { data:'action', title:'Aksi'},
            ],
        });
    });
</script>
@endsection