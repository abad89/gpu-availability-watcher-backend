require 'net/http'
require 'json'
require './.api_key.rb'

class Gpu < ApplicationRecord
    has_many :usergpus
    has_many :users, through: :usergpus

    @gpu_skus = [
        6429434,
        6471615,
        6466561,
        6467497,
        6466931,
        6468910,
        6454328,
        6476229,
        6467788,
        6467500,
        6471287,
        6439384,
        6468928,
        6429440,
        6439402,
        6477077,
        6429442,
        6465789,
        6462956,
        6479524,
        6434198,
        6471286,
        6480289,
        6475224,
        6432445,
        6468931,
        6467808,
        6432400,
        6467782,
        6471952,
        6454329,
        6471960,
        6480291,
        6472637,
        6479528,
        6445108,
        6471954,
        6479686,
        6452573,
        6471957,
        6467779,
        6444444,
        6437912,
        6462173,
        6468932,
        6471951,
        6468933,
        6430623,
        6465803,
        6452940,
        6432447,
        6475228,
        6475226,
        6466564,
        6476230,
        6480306,
        6436219,
        6466932,
        6468863,
        6439299,
        6475238,
        6475223,
        6439128,
        6462266,
        6432446,
        6460665,
        6439127,
        6460666,
        6480307,
        6462198,
        6468925,
        6475237,
        6439385,
        6467840,
        6442485,
        6471958,
        6441172,
        6467838,
        6436223,
        6442484,
        6430620,
        6438278,
        6454688,
        6437910,
        6467785,
        6430621,
        6467289,
        6437909,
        6430175,
        6430215,
        6438279,
        6430624,
        6454689,
        6454318,
        6472646,
        6480308,
        6479688,
        6467781,
        6479685
    ]
    
    def self.get_gpu(sku)
        url = 'https://api.bestbuy.com/v1/products/'
        args = '.json?show=active,sku,name,salePrice,onlineAvailability,orderable,url,largeImage&apiKey='
        uri = URI(url+sku.to_s+args+$api_key)
        response = Net::HTTP.get(uri)
        this_gpu = JSON.parse(response)
        new_gpu = Gpu.create(name: this_gpu["name"], salePrice: this_gpu["salePrice"], sku: this_gpu["sku"], onlineAvailability: this_gpu["onlineAvailability"], url: this_gpu["url"], largeImage: this_gpu["largeImage"], active: this_gpu["active"])
    end
    
    def self.get_gpus
        @gpu_skus.each do |sku|
            Gpu.get_gpu(sku)
            sleep(0.5)
        end
    end

    def self.update_availability(sku)
        current_gpu = Gpu.find_by(sku: sku)
        if current_gpu
            url = 'https://api.bestbuy.com/v1/products/'
            args = '.onlineAvailability&apiKey='
            uri = URI(url+sku.to_s+args+$api_key)
            response = Net::HTTP.get(uri)
            this_gpu = JSON.parse(response)
            current_gpu.update(onlineAvailability: this_gpu["onlineAvailability"])
        end
    end

    def self.update_availability_all
        @gpu_skus.each do |sku|
            Gpu.update_availability(sku)
            sleep(0.5)
        end
        Update.first.increment!(:count)
    end

    
end


# if foo do

# end